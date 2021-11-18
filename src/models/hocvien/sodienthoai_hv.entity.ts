import {

    Entity,
    JoinColumn,
    ManyToOne,
    PrimaryColumn,
  } from 'typeorm';
import { Hocvien } from './hocvien.entity';


  
  @Entity()
  export class Sodienthoai_hv {
    @PrimaryColumn()
    Sodienthoai: number;
  
    @ManyToOne(() => Hocvien)
    @JoinColumn()
    hocvien: Hocvien;
  
  }
  