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

@Controller()
export class AuthController {
  constructor(private jwtService: JwtService) {}

  @Get('login')
  @Render("login/index")
  async loginPage(@Req() req: Request) {
    const message = req.query['message'];
    const viewBag = {
        message: message
    }
    return viewBag;
}

  @Get('google/callback')
  @UseGuards(AuthGuard('google'))
  async googleCallback(@Req() req: Request, @Res() res: Response): Promise<any> {
    const user = req.user;

    const accessToken = this.jwtService.sign(user);
    res.cookie('LB', accessToken);
    // return res.redirect('/main');
  }

  @Get('logout')
  async logout(@Req() req: Request, @Res() res: Response) {
    res.clearCookie('LB');
    return res.redirect('/login');
  }
}
