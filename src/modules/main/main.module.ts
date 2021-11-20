
import { Module } from "@nestjs/common";
import { TypeOrmModule } from "@nestjs/typeorm";
import { Hocvien } from "src/models/hocvien/hocvien.entity";
import { hocvienService } from "src/services/hocvien.service";

import { JwtStrategy } from "../auth/jwt.strategy";
import { MainController } from "./main.controller";
import { RegisterController } from "./register.controller";
import { UpdateinfoController } from "./updateinfo.controller";

@Module({
    imports: [TypeOrmModule.forFeature([Hocvien])],
    providers: [hocvienService],
    controllers: [MainController,UpdateinfoController,RegisterController]
})
  
export class MainModule { }
