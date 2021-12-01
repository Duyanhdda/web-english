import { Nhanvien } from './nhanvien.entity';
<<<<<<< HEAD
import { Column, Entity, Index, JoinColumn, ManyToOne, OneToOne, PrimaryColumn } from 'typeorm';
=======
import { Column, Entity, JoinColumn, ManyToOne, OneToOne, PrimaryColumn } from 'typeorm';
>>>>>>> 1570bda235ae0b8e6e158bfc2254b25c6a4b5303

@Entity()
export class user_nv {
  @PrimaryColumn()
  username: string;

  @Column()
  password: string;

<<<<<<< HEAD
  @Column()
  role: number;

  @OneToOne(() => Nhanvien, { 
    onDelete: "CASCADE",
    onUpdate: "CASCADE",})
  @Index({ unique: true })
=======
  @OneToOne(() => Nhanvien, { primary: true,
    onDelete: "CASCADE",
    onUpdate: "CASCADE",})
>>>>>>> 1570bda235ae0b8e6e158bfc2254b25c6a4b5303
  @JoinColumn()
  nhanvien: Nhanvien;
}
