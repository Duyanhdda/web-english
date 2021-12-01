import { Userservice } from './../../services/user.service';

import { Injectable, UnauthorizedException } from '@nestjs/common';
import { PassportStrategy } from '@nestjs/passport';
import { Strategy } from 'passport-local';
import * as bcrypt from 'bcrypt';
import { hocvienService } from 'src/services/hocvien.service';

@Injectable()
export class LocalStrategy extends PassportStrategy(Strategy) {
  constructor(
    private hocvienService: hocvienService,
    private userservice: Userservice,
  ) {
    super({
      usernameField: 'email',
    });
  }
  //Authentication : Xác Thực
  //Authorication: Xác Nhận
  async validate(email: string, password: string) {
    const user = await this.hocvienService.getByEmail(email);
    const user1 = await this.userservice.getByemail(email);
    // console.log(user);

    if (!user && !user1 )
      throw new UnauthorizedException('Không tồn tại tài khoản này');
    if (!user1) {
        if (!(await bcrypt.compare(password, user.password)))
        throw new UnauthorizedException('Sai tài khoản hoặc mật khẩu');
        return {
        email: user.Email,
      };
    } 
    else {
        if (!(await bcrypt.compare(password, user1.password)))
        throw new UnauthorizedException('Sai tài khoản hoặc mật khẩu');
        return {
        //Return 1 cái json
        email: user1.username, 
      };  
    }
  }
}
