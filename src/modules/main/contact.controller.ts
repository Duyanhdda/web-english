import { Response, Request } from 'express';
import { Controller, Get, Render, Post, Body, Res, UseGuards, Req } from "@nestjs/common";
import { AuthGuard } from '@nestjs/passport'; 
@Controller("contacts")
export class ContactController {

    @Get()  
    @Render("home/contact")
    async index(@Req() req: Request, @Res() res: Response) {
    }
}