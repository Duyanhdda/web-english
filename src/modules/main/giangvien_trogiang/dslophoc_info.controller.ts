import { FunctionService } from './../../../services/function.service';
import { Response, Request } from 'express';
import { Controller, Get, Render, Post, Body, Res, UseGuards, Req } from "@nestjs/common";
import { AuthGuard } from '@nestjs/passport'; 
import { Userservice } from 'src/services/user.service';
@Controller("dslophoc")
export class DslophocController {
    constructor (private userservice: Userservice , private functionService: FunctionService) {}

    @Get()  
    @UseGuards(AuthGuard('jwt'))
    @Render("giaovientrogiang/classlist/index.pug")
    async index(@Req() req: Request, @Res() res: Response) {
        var picture: string = req.user["picture"] as string;

        var data = await this.functionService.DanhsachLH_phutrach_Thongtinchitiet_LH('GV001');
        console.log(data);
        if(!picture) picture = "/images/faces/face11.jpg";
        const viewBag = {
            data:data[0],
            picture: picture
        }
        return viewBag;
    }
}