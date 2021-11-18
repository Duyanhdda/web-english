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
import { Lophoc } from '../lophoc/lophoc.entity';
import { Trogiang } from '../nhanvien/trogiang.entity';

@Entity()
export class Hotro {
  @ManyToOne((type) => Lophoc, { primary: true })
  @JoinColumn()
  lophoc: Lophoc;

  @ManyToOne((type) => Trogiang, { primary: true })
  @JoinColumn()
  trogiang: Trogiang;
}
