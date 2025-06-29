#!/bin/bash

# 20250629194313
# Tạo bởi Gemini-2.5-Flash

# --- Cấu hình ---
NUM_NOTES=50         # Số lượng nốt nhạc bạn muốn tạo
MIN_FREQ=200         # Dải tần số (Hz)
MAX_FREQ=1000
MIN_DUR=0.1          # Dải thời lượng (giây)
MAX_DUR=0.3
OUTPUT_FILENAME="beep.wav"

# --- Khởi tạo các biến cho Filter Graph ---
FILTER_DEFINITIONS="" # Phần định nghĩa các sine filter (e.g., sine=...[s1];)
CONCAT_INPUTS=""      # Phần liệt kê các inputs cho concat (e.g., [s1][s2])
N_COUNT=0             # Đếm số lượng nốt

# --- Tạo từng nốt nhạc và xây dựng chuỗi Filter Graph ---
for i in $(seq 1 $NUM_NOTES); do
    # Sinh tần số ngẫu nhiên
    # shuf là lựa chọn tốt. Nếu không có, dùng $(( RANDOM % (MAX_FREQ - MIN_FREQ + 1) + MIN_FREQ ))
    FREQ=$(shuf -i $MIN_FREQ-$MAX_FREQ -n 1)

    # Sinh thời lượng ngẫu nhiên (sử dụng awk để xử lý số thập phân)
    DUR=$(awk -v min=$MIN_DUR -v max=$MAX_DUR 'BEGIN{srand(); print min + rand() * (max - min)}')

    # Thêm định nghĩa sine filter vào chuỗi
    FILTER_DEFINITIONS+="sine=frequency=${FREQ}:duration=${DUR}:sample_rate=44100[s$i];" # Thêm sample_rate để đảm bảo nhất quán

    # Thêm nhãn input vào chuỗi cho concat
    CONCAT_INPUTS+="[s$i]"

    # Tăng số lượng nốt
    N_COUNT=$((N_COUNT+1))
done

# --- Xây dựng hoàn chỉnh chuỗi Filter Graph ---
# Ghép các định nghĩa sine filter với bộ lọc concat
# Đảm bảo cú pháp đúng: sine1;sine2;...;[s1][s2]...concat=...
FULL_FILTER_GRAPH="${FILTER_DEFINITIONS}${CONCAT_INPUTS}concat=n=${N_COUNT}:v=0:a=1[out]"

# --- Debug: In ra chuỗi Filter Graph để kiểm tra ---
echo "--- FFmpeg Filter Graph Debug ---"
echo "$FULL_FILTER_GRAPH"
echo "---------------------------------"

# --- Chạy lệnh FFmpeg ---
# SỬ DỤNG -filter_complex THAY VÌ -f lavfi -i
ffmpeg -y -filter_complex "$FULL_FILTER_GRAPH" -map "[out]" "$OUTPUT_FILENAME"

echo "Đã tạo giai điệu ngẫu nhiên: $OUTPUT_FILENAME"
