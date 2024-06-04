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


result=$(echo "$text" | sed "s/\\D/D/g; s/\\d/d/g; s/Y\./Ỵ/g; s/y\./ỵ/g; s/Y'/Ý/g; s/y'/ý/g; s/Y~/Ỹ/g; s/y~/ỹ/g; s/Y?/Ỷ/g; s/y?/ỷ/g; s/Y\`/Ỳ/g; s/y\`/ỳ/g; s/Y/Y/g; s/y/y/g; s/U+\\./Ự/g; s/u+\\./ự/g; s/U+'/Ứ/g; s/u+'/ứ/g; s/U+~/Ữ/g; s/u+~/ữ/g; s/U+?/Ử/g; s/u+?/ử/g; s/U+\`/Ừ/g; s/u+\`/ừ/g; s/U+/Ư/g; s/u+/ư/g; s/U\./Ụ/g; s/u\./ụ/g; s/U'/Ú/g; s/u'/ú/g; s/U~/Ũ/g; s/u~/ũ/g; s/U?/Ủ/g; s/u?/ủ/g; s/U\`/Ù/g; s/u\`/ù/g; s/U/U/g; s/u/u/g; s/O+\./Ợ/g; s/o+\./ợ/g; s/O+'/Ớ/g; s/o+'/ớ/g; s/O+~/Ỡ/g; s/o+~/ỡ/g; s/O+?/Ở/g; s/o+?/ở/g; s/O+\`/Ờ/g; s/o+\`/ờ/g; s/O+/Ơ/g; s/o+/ơ/g; s/O^\./Ộ/g; s/o^\./ộ/g; s/O^'/Ố/g; s/o^'/ố/g; s/O^~/Ỗ/g; s/o^~/ỗ/g; s/O^?/Ổ/g; s/o^?/ổ/g; s/O^\`/Ồ/g; s/o^\`/ồ/g; s/O^/Ô/g; s/o^/ô/g; s/O\./Ọ/g; s/o\./ọ/g; s/O'/Ó/g; s/o'/ó/g; s/O~/Õ/g; s/o~/õ/g; s/O?/Ỏ/g; s/o?/ỏ/g; s/O\`/Ò/g; s/o\`/ò/g; s/O/O/g; s/o/o/g; s/I\./Ị/g; s/i\./ị/g; s/I'/Í/g; s/i'/í/g; s/I~/Ĩ/g; s/i~/ĩ/g; s/I?/Ỉ/g; s/i?/ỉ/g; s/I\`/Ì/g; s/i\`/ì/g; s/I/I/g; s/i/i/g; s/E^\./Ệ/g; s/e^\./ệ/g; s/E^'/Ế/g; s/e^'/ế/g; s/E^~/Ễ/g; s/e^~/ễ/g; s/E^?/Ể/g; s/e^?/ể/g; s/E^\`/Ề/g; s/e^\`/ề/g; s/E^/Ê/g; s/e^/ê/g; s/E\./Ẹ/g; s/e\./ẹ/g; s/E'/É/g; s/e'/é/g; s/E~/Ẽ/g; s/e~/ẽ/g; s/E?/Ẻ/g; s/e?/ẻ/g; s/E\`/È/g; s/e\`/è/g; s/E/E/g; s/e/e/g; s/DD/Đ/g; s/Dd/Đ/g; s/dd/đ/g; s/D/D/g; s/d/d/g; s/A^\./Ậ/g; s/a^\./ậ/g; s/A^'/Ấ/g; s/a^'/ấ/g; s/A^~/Ẫ/g; s/a^~/ẫ/g; s/A^?/Ẩ/g; s/a^?/ẩ/g; s/A^\`/Ầ/g; s/a^\`/ầ/g; s/A^/Â/g; s/a^/â/g; s/A(\./Ặ/g; s/a(\./ặ/g; s/A('/Ắ/g; s/a('/ắ/g; s/A(~/Ẵ/g; s/a(~/ẵ/g; s/A(?/Ẳ/g; s/a(?/ẳ/g; s/A(\`/Ằ/g; s/a(\`/ằ/g; s/A(/Ă/g; s/a(/ă/g; s/A\./Ạ/g; s/a\./ạ/g; s/A'/Á/g; s/a'/á/g; s/A~/Ã/g; s/a~/ã/g; s/A?/Ả/g; s/a?/ả/g; s/A\`/À/g; s/a\`/à/g; s/A/A/g; s/a/a/g;" | sed 's/\\\([.?`(\'\'']\)/\1/g')


if [ "$should_copy" = "yes" ]; then
  echo "$result" | xsel -bi
else
  echo "$result"
fi
