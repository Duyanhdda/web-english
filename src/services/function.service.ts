import { Hocvien } from './../models/hocvien/hocvien.entity';
import { Injectable } from "@nestjs/common";
import { InjectRepository } from "@nestjs/typeorm";
import { Repository } from 'typeorm';

@Injectable()
export class FunctionService {
    constructor(
        @InjectRepository(Hocvien) private functionRepository: Repository<Hocvien>
    ) { }
    // Danh sách toàn bộ khóa học
    async getAllkhoahoc() {
        return await this.functionRepository.query(
            "CALL DanhsachKhoaHoc()"
          );
    }
    // Danh sách khóa học sử dụng giáo trình nào
    async getAllgt(MaKH: string): Promise<[]> {
    return await this.functionRepository.query(
        "CALL xemdanhsach_GT('"+MaKH +"')");
        
    }
    //  xóa sử dụng của giáo trình đối với khóa học
    async delete(MaKH: string, MaGT:string) {
        return await this.functionRepository.query(
            "CALL sudung_delete('"+MaGT +"','"+ MaKH + "')");
            
        }
    // Danh sách toàn bộ giáo trình 
    async DanhsachToanboGiaotrinh(): Promise<any> {
        return await this.functionRepository.query(
            "CALL 	DanhsachToanboGiaotrinh()");
    }
    // Thêm mới sử dụng của giáo trình với khóa học
    async themmoi_gt_kh(MaKH: string, MaGT:string) {
        return await this.functionRepository.query(
            "CALL sudung_insert('"+MaGT +"','"+ MaKH + "')");
    }
    // Xem danh sách toàn bộ giáo viên của khóa học
    async data_gv(MaKH: string) {
        return await this.functionRepository.query(
            "CALL xemdanhsach_GV('"+MaKH +"')");
            
    }
    // xem danh sách trợ giảng của khóa học
    async data_tg(MaKH: string) {
        return await this.functionRepository.query(
            "CALL xemdanhsach_TG('"+MaKH +"')");   
    }
    // Xem danh sách các lớp học đăng ký hiện tại
    async xemdanhsach_dangky_hientai_HV(MaHV: string) {
        return await this.functionRepository.query(
            "CALL xemdanhsach_dangky_hientai_HV('"+MaHV +"')");
    }


    // Xem danh sách các lớp học đăng ký hiện tại
    async xemdanhsachLH_dangmo(MaKH: string) {
        return await this.functionRepository.query(
            "CALL xemdanhsachLH_dangmo('"+MaKH +"')");
        }

        // xem danh sách thời khóa biểu của lớp học đang mở của khóa học
    async xemdanhsachTKB_LH_dangmo(MaKH: string) {
        return await this.functionRepository.query(
            "CALL xemdanhsachTKB_LH_dangmo('"+MaKH +"')");
    }



    // Đăng ký lớp học
    async dangkylophoc(MaHV: string ,MaLH: string) {
        return await this.functionRepository.query(
            "SELECT dangkylophoc('"+MaHV +"','"+ MaLH + "') as Result");
    }
    // Hủy đăng ký lớp học
    async huydangkylophoc(MaHV: string ,MaLH: string) {
        return await this.functionRepository.query(
            "SELECT huydangkylophoc('"+MaHV +"','"+ MaLH + "') as Result");
    }

    // Chuyển lớp học
    async chuyenlophoc(MaHV: string ,MaLH: string, Malophientai: string) {
        return await this.functionRepository.query(
            "SELECT chuyenlophoc('"+MaHV +"','"+ MaLH + "','"+ Malophientai +"') as Result");
    }
    // async getOne(id: string , email: string ): Promise<Hocvien> {
    //     return await this.hocvienRepository.findOne(Number(id)); //Phải convert id sang number vì id của faculty là NUMBER chứ không phải là string
    // }

    // async getByEmail( email: string): Promise<Hocvien> {
    //     return await this.hocvienRepository.findOne({Email: email});
    // }

    // async getById(id: string): Promise<Hocvien> {
    //     return await this.hocvienRepository.findOne(id);
    // }

    // async add(hocvien: Hocvien): Promise<void> {
    //     //console.log(hocvien);
    //     await this.hocvienRepository.insert(hocvien);
    // }

    // async edit(hocvien: Hocvien): Promise<void> {
    //     await this.hocvienRepository.update(hocvien.MaHV, hocvien);
    // }

    // async savedata(hocvien: Hocvien): Promise<void> {
    //     await this.hocvienRepository.save(hocvien);
    // }

    // async delete(hocvien: hocvien): Promise<void> {
    //     await this.hocvienRepository.delete(hocvien.id);
    // }

    // //CurrentLibrary
    // async getCurrent(): Promise<hocvien[]> {
    //     return await this.hocvienRepository.find({ currentStatus: true });
    // }

     

}
