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


result=$(echo "$text" | sed 's/y5/ỵ/g; s/y4/ỹ/g; s/y3/ỷ/g; s/y2/ỳ/g; s/y1/ý/g; s/y\\/y/g; s/u75/ự/g; s/u74/ữ/g; s/u73/ử/g; s/u72/ừ/g; s/u71/ứ/g; s/u7\\/ư/g; s/u7/ư/g; s/u5/ụ/g; s/u4/ũ/g; s/u3/ủ/g; s/u2/ù/g; s/u1/ú/g; s/u\\/u/g; s/o75/ợ/g; s/o74/ỡ/g; s/o73/ở/g; s/o72/ờ/g; s/o71/ớ/g; s/o7\\/ơ/g; s/o7/ơ/g; s/o65/ộ/g; s/o64/ỗ/g; s/o63/ổ/g; s/o62/ồ/g; s/o61/ố/g; s/o6\\/ô/g; s/o6/ô/g; s/o5/ọ/g; s/o4/õ/g; s/o3/ỏ/g; s/o2/ò/g; s/o1/ó/g; s/o\\/o/g; s/i5/ị/g; s/i4/ĩ/g; s/i3/ỉ/g; s/i2/ì/g; s/i1/í/g; s/i\\/i/g; s/e65/ệ/g; s/e64/ễ/g; s/e63/ể/g; s/e62/ề/g; s/e61/ế/g; s/e6\\/ê/g; s/e6/ê/g; s/e5/ẹ/g; s/e4/ẽ/g; s/e3/ẻ/g; s/e2/è/g; s/e1/é/g; s/e\\/e/g; s/d9/đ/g; s/d\\/d/g; s/a65/ậ/g; s/a64/ẫ/g; s/a63/ẩ/g; s/a62/ầ/g; s/a61/ấ/g; s/a6\\/â/g; s/a6/â/g; s/a85/ặ/g; s/a84/ẵ/g; s/a83/ẳ/g; s/a82/ằ/g; s/a81/ắ/g; s/a8\\/ă/g; s/a8/ă/g; s/a5/ạ/g; s/a4/ã/g; s/a3/ả/g; s/a2/à/g; s/a1/á/g; s/a\\/a/g; s/Y5/Ỵ/g; s/Y4/Ỹ/g; s/Y3/Ỷ/g; s/Y2/Ỳ/g; s/Y1/Ý/g; s/Y\\/Y/g; s/U75/Ự/g; s/U74/Ữ/g; s/U73/Ử/g; s/U72/Ừ/g; s/U71/Ứ/g; s/U7\\/Ư/g; s/U7/Ư/g; s/U5/Ụ/g; s/U4/Ũ/g; s/U3/Ủ/g; s/U2/Ù/g; s/U1/Ú/g; s/U\\/U/g; s/O75/Ợ/g; s/O74/Ỡ/g; s/O73/Ở/g; s/O72/Ờ/g; s/O71/Ớ/g; s/O7\\/Ơ/g; s/O7/Ơ/g; s/O65/Ộ/g; s/O64/Ỗ/g; s/O63/Ổ/g; s/O62/Ồ/g; s/O61/Ố/g; s/O6\\/Ô/g; s/O6/Ô/g; s/O5/Ọ/g; s/O4/Õ/g; s/O3/Ỏ/g; s/O2/Ò/g; s/O1/Ó/g; s/O\\/O/g; s/I5/Ị/g; s/I4/Ĩ/g; s/I3/Ỉ/g; s/I2/Ì/g; s/I1/Í/g; s/I\\/I/g; s/E65/Ệ/g; s/E64/Ễ/g; s/E63/Ể/g; s/E62/Ề/g; s/E61/Ế/g; s/E6\\/Ê/g; s/E6/Ê/g; s/E5/Ẹ/g; s/E4/Ẽ/g; s/E3/Ẻ/g; s/E2/È/g; s/E1/É/g; s/E\\/E/g; s/D9/Đ/g; s/D\\/D/g; s/D/D/g; s/A65/Ậ/g; s/A64/Ẫ/g; s/A63/Ẩ/g; s/A62/Ầ/g; s/A61/Ấ/g; s/A6\\/Â/g; s/A6/Â/g; s/A85/Ặ/g; s/A84/Ẵ/g; s/A83/Ẳ/g; s/A82/Ằ/g; s/A81/Ắ/g; s/A8\\/Ă/g; s/A8/Ă/g; s/A5/Ạ/g; s/A4/Ã/g; s/A3/Ả/g; s/A2/À/g; s/A1/Á/g; s/A\\/A/g;')


if [ "$should_copy" = "yes" ]; then
  echo "$result" | xsel -bi
else
  echo "$result"
fi
