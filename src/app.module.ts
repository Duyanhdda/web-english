import { Module } from '@nestjs/common';
import { ConfigModule } from '@nestjs/config';
<<<<<<< HEAD
import { APP_FILTER } from '@nestjs/core';
import { TypeOrmModule } from '@nestjs/typeorm';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { UnauthorizedExceptionFilter } from './filters/unauthorized-exception.filter';
=======
import { TypeOrmModule } from '@nestjs/typeorm';
import { AppController } from './app.controller';
import { AppService } from './app.service';
>>>>>>> 1570bda235ae0b8e6e158bfc2254b25c6a4b5303
import { AuthModule } from './modules/auth/auth.module';
import { MainModule } from './modules/main/main.module';

@Module({
  imports: [TypeOrmModule.forRoot(), ConfigModule.forRoot(),AuthModule,MainModule],
  controllers: [AppController],
<<<<<<< HEAD
  providers: [AppService,    
    {
    provide: APP_FILTER,
    useClass: UnauthorizedExceptionFilter
  },],
=======
  providers: [AppService],
>>>>>>> 1570bda235ae0b8e6e158bfc2254b25c6a4b5303
})
export class AppModule {}
