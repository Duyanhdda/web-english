import { Response, Request } from 'express';
import { Controller, Get, Render, Post, Body, Res, UseGuards, Req } from "@nestjs/common";
import { AuthGuard } from '@nestjs/passport'; 
@Controller("product")
export class ProductController {

    @Get()  
    @Render("home/product")
    async index(@Req() req: Request, @Res() res: Response) {
    }
}