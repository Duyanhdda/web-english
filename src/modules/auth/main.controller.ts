import { Response, Request } from 'express';
import { Controller, Get, Render, Post, Body, Res, UseGuards, Req } from "@nestjs/common";
import { AuthGuard } from '@nestjs/passport'; 
@Controller("main")
export class MainController {

    @Get()  
    @UseGuards(AuthGuard('jwt'))
    @Render("layout")
    async index(@Req() req: Request, @Res() res: Response) {
        const picture: string = req.user["picture"] as string;
        const viewBag = {
            picture: picture
        }
        return viewBag;
    }
}