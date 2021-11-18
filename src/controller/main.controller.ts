import { Response, Request } from 'express';
import { Controller, Get, Render, Post, Body, Res, UseGuards } from "@nestjs/common";
@Controller("main")
export class MainController {
    @Get()
    @Render("layout")
    async index() {
    }
}