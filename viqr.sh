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


result=$(echo "$text" | sed 's/A^'"'"'/Ấ/g;s/A^`/Ầ/g;s/A^?/\Ẩ/g;s/A^~/\Ẫ/g;s/A^\./Ậ/g;s/A^/Â/g;s/A('"'"'/Ắ/g;s/A(`/\Ằ/g;s/A(?/\Ẳ/g;s/A(~/\Ẵ/g;s/A(\./Ặ/g;s/A(/Ă/g;s/E^'"'"'/Ế/g;s/E^`/Ề/g;s/E^?/\Ể/g;s/E^~/\Ễ/g;s/E^\./Ệ/g;s/E^/Ê/g;s/O^'"'"'/Ố/g;s/O^`/Ồ/g;s/O^?/\Ổ/g;s/O^~/\Ỗ/g;s/O^\./Ộ/g;s/O^/Ô/g;s/O+'"'"'/Ớ/g;s/O+`/Ờ/g;s/O+?/\Ở/g;s/O+~/\Ỡ/g;s/O+\./Ợ/g;s/O+/Ơ/g;s/U+'"'"'/Ứ/g;s/U+`/Ừ/g;s/U+?/\Ử/g;s/U+~/\Ữ/g;s/U+\./Ự/g;s/U+/Ư/g;s/a^'"'"'/ấ/g;s/a^`/ầ/g;s/a^?/\ẩ/g;s/a^~/\ẫ/g;s/a^\./ậ/g;s/a^/â/g;s/a('"'"'/ắ/g;s/a(`/\ằ/g;s/a(?/\ẳ/g;s/a(~/\ẵ/g;s/a(\./ặ/g;s/a(/ă/g;s/e^'"'"'/ế/g;s/e^`/ề/g;s/e^?/\ể/g;s/e^~/\ễ/g;s/e^\./ệ/g;s/e^/ê/g;s/o^'"'"'/ố/g;s/o^`/ồ/g;s/o^?/\ổ/g;s/o^~/\ỗ/g;s/o^\./ộ/g;s/o^/ô/g;s/o+'"'"'/ớ/g;s/o+`/ờ/g;s/o+?/\ở/g;s/o+~/\ỡ/g;s/o+\./ợ/g;s/o+/ơ/g;s/u+'"'"'/ứ/g;s/u+`/ừ/g;s/u+?/\ử/g;s/u+~/\ữ/g;s/u+\./ự/g;s/u+/ư/g;s/A'"'"'/Á/g;s/A`/À/g;s/A?/\Ả/g;s/A~/\Ã/g;s/A\./Ạ/g;s/E'"'"'/É/g;s/E`/È/g;s/E?/\Ẻ/g;s/E~/\Ẽ/g;s/E\./Ẹ/g;s/I'"'"'/Í/g;s/I`/Ì/g;s/I?/\Ỉ/g;s/I~/\Ĩ/g;s/I\./Ị/g;s/O'"'"'/Ó/g;s/O`/Ò/g;s/O?/\Ỏ/g;s/O~/\Õ/g;s/O\./Ọ/g;s/U'"'"'/Ú/g;s/U`/Ù/g;s/U?/\Ủ/g;s/U~/\Ũ/g;s/U\./Ụ/g;s/Y'"'"'/Ý/g;s/Y`/Ỳ/g;s/Y?/\Ỷ/g;s/Y~/\Ỹ/g;s/Y\./Ỵ/g;s/a'"'"'/á/g;s/a`/à/g;s/a?/\ả/g;s/a~/\ã/g;s/a\./ạ/g;s/e'"'"'/é/g;s/e`/è/g;s/e?/\ẻ/g;s/e~/\ẽ/g;s/e\./ẹ/g;s/i'"'"'/í/g;s/i`/ì/g;s/i?/\ỉ/g;s/i~/\ĩ/g;s/i\./ị/g;s/o'"'"'/ó/g;s/o`/ò/g;s/o?/\ỏ/g;s/o~/\õ/g;s/o\./ọ/g;s/u'"'"'/ú/g;s/u`/ù/g;s/u?/\ủ/g;s/u~/\ũ/g;s/u\./ụ/g;s/y'"'"'/ý/g;s/y`/ỳ/g;s/y?/\ỷ/g;s/y~/\ỹ/g;s/y\./ỵ/g;s/DD/Đ/g;s/Dd/Đ/g;s/dd/đ/g;s/\\D/D/g;s/\\d/d/g;')

if [ "$should_copy" = "yes" ]; then
  echo "$result" | xsel -bi
else
  echo "$result"
fi
