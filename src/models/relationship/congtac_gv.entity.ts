import { Chinhanh } from './../chinhanh.entity';
import { Giaovien } from './../nhanvien/giaovien.entity';
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
export class congtac_gv {
  @ManyToOne((type) => Giaovien, { primary: true })
  @JoinColumn()
  giaovien: Giaovien;

  @ManyToOne((type) => Chinhanh, { primary: true })
  @JoinColumn()
  chinhanh: Chinhanh;
}
