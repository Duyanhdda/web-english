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
import { Lophoc } from '../lophoc/lophoc.entity';

  
  @Entity()
  export class Dieuchinh_lh {
    
    @ManyToOne(type => Lophoc, { primary: true })
    @JoinColumn()
    lophoc: Lophoc;
  
    @ManyToOne(type => Quanlygiaoduc, { primary: true })
    @JoinColumn()
    quanlygiaoduc: Quanlygiaoduc;
  }

