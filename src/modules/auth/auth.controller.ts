// import { User } from './../../models/user.entity';
import { Request, Response } from 'express';
import {
  Controller,
  Get,
  Render,
  UseGuards,
  Post,
  Req,
  Res,
} from '@nestjs/common';
import { AuthGuard } from '@nestjs/passport';
import { JwtService } from '@nestjs/jwt';
import { hocvienService } from 'src/services/hocvien.service';
import { Hocvien } from 'src/models/hocvien/hocvien.entity';
import { Userservice } from 'src/services/user.service';
import { user_nv } from 'src/models/nhanvien/user_nv.entity';

@Controller()
export class AuthController {
  constructor(private jwtService: JwtService , private hocvienService: hocvienService ,private userservice: Userservice) {}

  @Get('login')
  @Render("login/index")
  async loginPage(@Req() req: Request) {
    const message = req.query['message'];
    const viewBag = {
        message: message
    }
    return viewBag;
}

@Post('login')
@UseGuards(AuthGuard('local')) //Gaurd là function validate trong file local.strategy.ts
async login(@Req() req: Request, @Res() res: Response) {
    const signedInfo: Object = req.user;
    const email: string = req.user["email"] as string;
    console.log(email);
    let user: Hocvien = await this.hocvienService.getByEmail(email);
    const user1: user_nv = await this.userservice.getByemail(email);

    const accessToken = this.jwtService.sign(signedInfo);
    res.cookie('LB', accessToken);
    if(user1 && user1.role == 2) {
      res.redirect('giangvien');
    }
    if(user1 && user1.role == 3) {
      res.redirect('quanlygiaoduc');
    }  
    if (user){
      res.redirect('hocviencourselist');
    }

    
}

  @Get('google/callback')
  @UseGuards(AuthGuard('google'))
  async googleCallback(@Req() req: Request, @Res() res: Response): Promise<any> {
    const user = req.user;
    const email: string = req.user["email"] as string;
    const getbyemail = await this.hocvienService.getByEmail(email);
    const accessToken = this.jwtService.sign(user);
    res.cookie('LB', accessToken); 
    if (!getbyemail){
      return res.redirect('/updatehocvien');
    }
    else
        return res.redirect('/hocviencourselist');
  }

  @Get('logout')
  async logout(@Req() req: Request, @Res() res: Response) {
    res.clearCookie('LB');
    return res.redirect('/login');
  }
}
