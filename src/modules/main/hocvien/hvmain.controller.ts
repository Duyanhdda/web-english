import { Response, Request } from 'express';
import { Controller, Get, Render, Post, Body, Res, UseGuards, Req } from "@nestjs/common";
import { AuthGuard } from '@nestjs/passport'; 
@Controller("hocvien")
export class HvmainController {

    @Get()  
    @UseGuards(AuthGuard('jwt'))
    @Render("hocvien/layout")
    async index(@Req() req: Request, @Res() res: Response) {
        var picture: string = req.user["picture"] as string;
        if(!picture) picture = "/images/faces/face11.jpg";
        const viewBag = {
            picture: picture
        }
        return viewBag;
    }
}