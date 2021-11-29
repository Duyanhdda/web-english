import { Response, Request } from 'express';
import { Controller, Get, Render, Post, Body, Res, UseGuards, Req } from "@nestjs/common";
import { AuthGuard } from '@nestjs/passport'; 
@Controller("catalog")
export class CatalogController {

    @Get()  
    @Render("home/catalog")
    async index(@Req() req: Request, @Res() res: Response) {
    }
}