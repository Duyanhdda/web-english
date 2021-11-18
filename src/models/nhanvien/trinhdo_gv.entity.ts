import { Giaovien } from './giaovien.entity';
import { Entity, JoinColumn, ManyToOne, PrimaryColumn } from 'typeorm';

@Entity()
export class Trinhdo_gv {
  @PrimaryColumn()
  trinhdo: string;

  @ManyToOne(() => Giaovien, { primary: true})
  @JoinColumn()
  giaovien: Giaovien;
}
