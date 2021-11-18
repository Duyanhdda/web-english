import {
    Column,
    CreateDateColumn,
    Entity,
    JoinColumn,
    ManyToMany,
    ManyToOne,
    PrimaryColumn,
    UpdateDateColumn,
  } from 'typeorm';
import { Quanlygiaoduc } from '../nhanvien/quanlygiaoduc.entity';
import { Khoahoc } from '../khoahoc/khoahoc.entity';

  
  @Entity()
  export class Dieuchinh_kh {
    
    @ManyToOne(type => Khoahoc, { primary: true })
    @JoinColumn()
    khoahoc: Khoahoc;
  
    @ManyToOne(type => Quanlygiaoduc, { primary: true })
    @JoinColumn()
    quanlygiaoduc: Quanlygiaoduc;
  }

