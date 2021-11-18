
import { Chinhanh } from './../chinhanh.entity';
import { Trogiang } from './../nhanvien/trogiang.entity';
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

@Entity()
export class Congtac_tg {
  @ManyToOne((type) => Trogiang, { primary: true })
  @JoinColumn()
  trogiang: Trogiang;

  @ManyToOne((type) => Chinhanh, { primary: true })
  @JoinColumn()
  chinhanh: Chinhanh;
}
