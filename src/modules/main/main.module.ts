import { Khoahoc } from './../../models/khoahoc/khoahoc.entity';

import { Module } from "@nestjs/common";
import { TypeOrmModule } from "@nestjs/typeorm";
import { Hocvien } from "src/models/hocvien/hocvien.entity";
import { hocvienService } from "src/services/hocvien.service";

import { JwtStrategy } from "../auth/jwt.strategy";
import { MainController } from "./main.controller";
import { RegisterController } from "./hocvien/register.controller";
import { UpdateinfoController } from "./hocvien/updateinfo.controller";
import { CourselistController } from "./courselist.controller";
import { FunctionService } from "src/services/function.service";
import { CapnhatkhController } from "./quanlygiaoduc/capnhatkh.controller";
import { QlgdmainController } from "./quanlygiaoduc/qlgdmain.controller";
import { HvmainController } from "./hocvien/hvmain.controller";
import { KhoahocService } from "src/services/khoahoc.service";
import { CapnhatgtController } from './quanlygiaoduc/capnhatgt.controller';
import { HocviencourselistController } from './hocvien/courselist.controller';
import { DangkylhController } from './hocvien/dangkylh.controller';

@Module({
    imports: [TypeOrmModule.forFeature([Hocvien,Khoahoc])],
    providers: [hocvienService,FunctionService,KhoahocService],
    controllers: [MainController,UpdateinfoController,RegisterController,CourselistController,
    CapnhatkhController,QlgdmainController,HvmainController,CapnhatgtController,HocviencourselistController,
    DangkylhController]
})
  
export class MainModule { }
