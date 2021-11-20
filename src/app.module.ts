import { Module } from '@nestjs/common';
import { ConfigModule } from '@nestjs/config';
import { TypeOrmModule } from '@nestjs/typeorm';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { AuthModule } from './modules/auth/auth.module';
import { MainModule } from './modules/main/main.module';

@Module({
  imports: [TypeOrmModule.forRoot(), ConfigModule.forRoot(),AuthModule,MainModule],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}
