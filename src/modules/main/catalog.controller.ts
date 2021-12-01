import { Response, Request } from 'express';
import { Controller, Get, Render, Post, Body, Res, UseGuards, Req } from "@nestjs/common";
import { AuthGuard } from '@nestjs/passport'; 
<<<<<<< HEAD
import { FunctionService } from 'src/services/function.service';
@Controller("catalog")
export class CatalogController {
    constructor (
    private functionService: FunctionService) {}
    @Get()  
    @Render("home/catalog")
    async index(@Req() req: Request, @Res() res: Response) {
        
    }

    @Post("/editup")
    async dangkylophoc(@Res() res: Response,@Body() data: any) {
        var list1  =  await this.functionService.xemdanhsachLH_dangmo(data.MaKH);
        var list = await this.functionService.editup(data.MaKH);
        console.log((typeof list1))
        return res.json(list1);
    } 
}    
=======
@Controller("catalog")
export class CatalogController {

    @Get()  
    @Render("home/catalog")
    async index(@Req() req: Request, @Res() res: Response) {
    }
}
>>>>>>> 1570bda235ae0b8e6e158bfc2254b25c6a4b5303
