# Tuyển Tập Bài Tập Flutter

Dự án Flutter này chứa 5 bài tập toàn diện bao gồm nhiều khái niệm về Flutter và Dart.

## Tổng Quan Các Bài Tập

### 1. Bài Tập List View ✅
**Vị trí**: `lib/exercises/list_view_exercise.dart`

**Tính năng**:
- Danh sách cuộn của 15 liên hệ
- Mỗi liên hệ bao gồm hình đại diện (CircleAvatar màu sắc với chữ cái đầu)
- Thông tin liên hệ: tên, số điện thoại, email
- Tương tác chạm với phản hồi SnackBar
- Thẻ Material Design với kiểu dáng phù hợp

**Những gì nó thể hiện**:
- ListView.builder để hiển thị danh sách hiệu quả
- Widget tùy chỉnh (ContactTile)
- Mô hình dữ liệu (lớp Contact)
- Các thành phần Material Design

---

### 2. Bài Tập Grid View ✅
**Vị trí**: `lib/exercises/grid_view_exercise.dart`

**Phần 1: GridView.count()**
- Cột cố định: 3
- Khoảng cách hàng: 8
- Khoảng cách cột: 8
- Tỷ lệ khung hình: 1
- Tiêu đề: "Lưới Cột Cố Định"

**Phần 2: GridView.extent()**
- Phạm vi trục chéo tối đa: 150
- Khoảng cách hàng: 10
- Khoảng cách cột: 10
- Tỷ lệ khung hình: 0.8
- Tiêu đề: "Lưới Linh Hoạt"

**Tính năng cho mỗi phần**:
- 12 mục lưới với container màu sắc
- Góc bo tròn và đường viền
- Biểu tượng trung tâm với nhãn
- Thiết kế đáp ứng

**Những gì nó thể hiện**:
- GridView.count() vs GridView.extent()
- Nguyên tắc bố cục lưới
- Widget mục lưới tùy chỉnh
- Biểu tượng và kiểu dáng Material

---

### 3. Bài Tập SharedPreferences ✅
**Vị trí**: `lib/exercises/shared_preferences_exercise.dart`

**Tính năng cốt lõi**:
- Nút Lưu Dữ Liệu → lưu trữ tên người dùng
- Nút Hiển Thị Dữ Liệu → truy xuất và hiển thị tên người dùng
- TextField để nhập tên
- Xử lý phù hợp khi không có dữ liệu

**Tính năng bổ sung đã triển khai**:
- ✅ Nút Xóa để loại bỏ dữ liệu đã lưu
- ✅ Các trường bổ sung: tuổi, email
- ✅ Hiển thị thời gian lưu cuối cùng
- ✅ Hiển thị dữ liệu thời gian thực
- ✅ Xác thực đầu vào

**Những gì nó thể hiện**:
- SharedPreferences để lưu trữ dữ liệu cục bộ
- Mẫu Async/await
- Xử lý biểu mẫu và xác thực
- Quản lý trạng thái
- Xử lý DateTime

---

### 4. Bài Tập Lập Trình Bất Đồng Bộ ✅
**Vị trí**: `lib/exercises/async_exercise.dart`

**Triển khai tác vụ**:
1. Hiển thị "Đang tải người dùng..." với chỉ báo tải
2. Chờ 3 giây sử dụng `Future.delayed()`
3. Hiển thị "Tải người dùng thành công!"
4. Tự động đặt lại sau 2 giây

**Tính năng bổ sung**:
- Trạng thái tải trực quan với CircularProgressIndicator
- Biểu tượng trạng thái thay đổi theo trạng thái
- Nút Thao Tác Nhanh (độ trễ 800ms)
- Nút Thao Tác Chậm (độ trễ 5s)
- Quản lý chu trình sống widget phù hợp

**Những gì nó thể hiện**:
- Future.delayed() cho các hoạt động async
- Quản lý trạng thái tải
- Cập nhật UI với setState()
- Chu trình sống widget (kiểm tra mounted)
- Nhiều hoạt động async

---

### 5. Bài Tập Isolate ✅
**Vị trí**: `lib/exercises/isolate_exercises.dart`

#### Thử Thách 1: Tính Toán Nặng
**Tính năng**:
- Tính giai thừa của các số lớn (lên đến 10.000)
- Sử dụng hàm `compute()` (wrapper isolate)
- Hiển thị chỉ báo tiến độ tải
- Hiển thị kết quả với cắt ngắn cho số rất dài
- Xác thực đầu vào và xử lý lỗi

#### Thử Thách 2: Giao Tiếp Isolate Nền
**Tính năng**:
- Tạo isolate nền sử dụng `Isolate.spawn()`
- Isolate worker gửi số ngẫu nhiên mỗi giây
- Isolate chính nhận và tính tổng các số
- Khi tổng > 100, gửi lệnh dừng cho worker
- Isolate worker thoát một cách ổn định sử dụng `Isolate.exit()`
- Ghi nhật ký tin nhắn thời gian thực
- Dọn dẹp isolate phù hợp

**Những gì nó thể hiện**:
- Tính toán nặng mà không chặn UI
- Giao tiếp isolate với SendPort/ReceivePort
- Xử lý nền
- Quản lý chu trình sống isolate
- Tin nhắn giữa các isolate

---

## Cấu Trúc Dự Án

```
lib/
├── main.dart                     # Trung tâm điều hướng cho tất cả bài tập
└── exercises/
    ├── list_view_exercise.dart   # Bài tập 1
    ├── grid_view_exercise.dart   # Bài tập 2
    ├── shared_preferences_exercise.dart # Bài tập 3
    ├── async_exercise.dart       # Bài tập 4
    └── isolate_exercises.dart    # Bài tập 5
```

## Phụ Thuộc

```yaml
dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^1.0.8
  shared_preferences: ^2.2.2  # Để lưu trữ dữ liệu cục bộ
```

## Cách Chạy

1. Sao chép repository
2. Chạy `flutter pub get` để cài đặt phụ thuộc
3. Chạy `flutter run` để khởi chạy ứng dụng
4. Điều hướng qua các bài tập sử dụng menu chính

## Kết Quả Học Tập Chính

- **ListView**: Hiển thị danh sách hiệu quả và widget tùy chỉnh
- **GridView**: Bố cục lưới đáp ứng với các phương pháp khác nhau
- **SharedPreferences**: Lưu trữ dữ liệu cục bộ và hoạt động async
- **Lập Trình Async**: Xử lý Future và trạng thái tải
- **Isolates**: Tính toán nặng và xử lý nền

Mỗi bài tập đều độc lập và thể hiện các khái niệm Flutter/Dart cụ thể với việc triển khai thực tế.