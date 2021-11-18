import {

    Entity,
    JoinColumn,
    ManyToOne,
    PrimaryColumn,
  } from 'typeorm';
import { Phuhuynh } from './phuhuynh.entity';



  
  @Entity()
  export class Sodienthoai_ph {
    @PrimaryColumn()
    Sodienthoai: number;
  
    @ManyToOne(() => Phuhuynh)
    @JoinColumn()
    phuhuynh: Phuhuynh;
  
  }
  