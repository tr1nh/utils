#!/usr/bin/env bash

should_copy="no"

if [ "$1" = "-b" ]; then
  should_copy="yes"
  shift
fi


if [ -z "$1" ]; then
  text=$(less <&0)
else
  text="$1"
fi


result=$(echo "$text" | sed 's/A/A/g; s/À/A/g; s/Á/A/g; s/Ả/A/g; s/Ã/A/g; s/Ạ/A/g; s/Ă/A/g; s/Ă/A/g; s/Ằ/A/g; s/Ắ/A/g; s/Ẳ/A/g; s/Ẵ/A/g; s/Ặ/A/g; s/Â/A/g; s/Â/A/g; s/Ầ/A/g; s/Ấ/A/g; s/Ẩ/A/g; s/Ẫ/A/g; s/Ậ/A/g; s/D/D/g; s/Đ/D/g; s/E/E/g; s/E/E/g; s/È/E/g; s/É/E/g; s/Ẻ/E/g; s/Ẽ/E/g; s/Ẹ/E/g; s/Ê/E/g; s/Ê/E/g; s/Ề/E/g; s/Ế/E/g; s/Ể/E/g; s/Ễ/E/g; s/Ệ/E/g; s/I/I/g; s/Ì/I/g; s/Í/I/g; s/Ỉ/I/g; s/Ĩ/I/g; s/Ị/I/g; s/O/O/g; s/Ò/O/g; s/Ó/O/g; s/Ỏ/O/g; s/Õ/O/g; s/Ọ/O/g; s/Ô/O/g; s/Ô/O/g; s/Ồ/O/g; s/Ố/O/g; s/Ổ/O/g; s/Ỗ/O/g; s/Ộ/O/g; s/Ơ/O/g; s/Ơ/O/g; s/Ờ/O/g; s/Ớ/O/g; s/Ở/O/g; s/Ỡ/O/g; s/Ợ/O/g; s/U/U/g; s/Ù/U/g; s/Ú/U/g; s/Ủ/U/g; s/Ũ/U/g; s/Ụ/U/g; s/Ư/U/g; s/Ư/U/g; s/Ừ/U/g; s/Ứ/U/g; s/Ử/U/g; s/Ữ/U/g; s/Ự/U/g; s/Y/Y/g; s/Ỳ/Y/g; s/Ý/Y/g; s/Ỷ/Y/g; s/Ỹ/Y/g; s/Ỵ/Y/g; s/a/a/g; s/à/a/g; s/á/a/g; s/ả/a/g; s/ã/a/g; s/ạ/a/g; s/ă/a/g; s/ă/a/g; s/ằ/a/g; s/ắ/a/g; s/ẳ/a/g; s/ẵ/a/g; s/ặ/a/g; s/â/a/g; s/â/a/g; s/ầ/a/g; s/ấ/a/g; s/ẩ/a/g; s/ẫ/a/g; s/ậ/a/g; s/d/d/g; s/đ/d/g; s/e/e/g; s/è/e/g; s/é/e/g; s/ẻ/e/g; s/ẽ/e/g; s/ẹ/e/g; s/ê/e/g; s/ê/e/g; s/ề/e/g; s/ế/e/g; s/ể/e/g; s/ễ/e/g; s/ệ/e/g; s/i/i/g; s/ì/i/g; s/í/i/g; s/ỉ/i/g; s/ĩ/i/g; s/ị/i/g; s/o/o/g; s/ò/o/g; s/ó/o/g; s/ỏ/o/g; s/õ/o/g; s/ọ/o/g; s/ô/o/g; s/ô/o/g; s/ồ/o/g; s/ố/o/g; s/ổ/o/g; s/ỗ/o/g; s/ộ/o/g; s/ơ/o/g; s/ơ/o/g; s/ờ/o/g; s/ớ/o/g; s/ở/o/g; s/ỡ/o/g; s/ợ/o/g; s/u/u/g; s/ù/u/g; s/ú/u/g; s/ủ/u/g; s/ũ/u/g; s/ụ/u/g; s/ư/u/g; s/ư/u/g; s/ừ/u/g; s/ứ/u/g; s/ử/u/g; s/ữ/u/g; s/ự/u/g; s/y/y/g; s/ỳ/y/g; s/ý/y/g; s/ỷ/y/g; s/ỹ/y/g; s/ỵ/y/g;')

if [ "$should_copy" = "yes" ]; then
  echo "$result" | xsel -bi
else
  echo "$result"
fi
