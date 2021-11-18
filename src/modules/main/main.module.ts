
import { TypeOrmModule } from '@nestjs/typeorm';
import { Module } from '@nestjs/common';
import { MainController } from 'src/controller/main.controller';



@Module({
    imports: [TypeOrmModule.forFeature([])],
    providers: [],
    controllers: [MainController]
})

export class MainModule { }