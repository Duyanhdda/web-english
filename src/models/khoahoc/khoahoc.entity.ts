import {
    Column,
    CreateDateColumn,
    Entity,
    PrimaryColumn,
    UpdateDateColumn,
  } from 'typeorm';

  enum trangthai {
    Male = 'opening',
    Female = 'closed',
  }
  
  @Entity()
  export class Khoahoc {
    @PrimaryColumn()
    MaKH: string;
  
    @Column({ nullable: true })
    Ten: string;
  
    @Column({ nullable: true})
    Hocphi: number;
  
    @Column()
    Noidung: string;
  
    @Column()
    Thoiluong: number;
  
    @Column()
    Trangthai: trangthai;
  
    @Column()
    Gioihansiso: number; 
  
    @Column()
    Yeucautrinhdo: number;
<<<<<<< HEAD

    @Column()
    url: string;

    @Column()
    up: Boolean;
=======
>>>>>>> 1570bda235ae0b8e6e158bfc2254b25c6a4b5303
  }
  