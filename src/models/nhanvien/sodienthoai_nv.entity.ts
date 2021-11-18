import { Nhanvien } from './nhanvien.entity';
import { Entity, JoinColumn, ManyToOne, PrimaryColumn } from 'typeorm';

@Entity()
export class Sodienthoai_nv {
  @PrimaryColumn()
  Sodienthoai: number;

  @ManyToOne(() => Nhanvien)
  @JoinColumn()
  nhanvien: Nhanvien;
}
