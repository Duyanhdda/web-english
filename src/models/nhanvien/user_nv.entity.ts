import { Nhanvien } from './nhanvien.entity';
import { Column, Entity, JoinColumn, ManyToOne, OneToOne, PrimaryColumn } from 'typeorm';

@Entity()
export class user_nv {
  @PrimaryColumn()
  username: string;

  @Column()
  password: string;

  @OneToOne(() => Nhanvien, { primary: true,
    onDelete: "CASCADE",
    onUpdate: "CASCADE",})
  @JoinColumn()
  nhanvien: Nhanvien;
}
