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


result=$(echo "$text" | sed 's/yj/ỵ/g; s/yx/ỹ/g; s/yr/ỷ/g; s/ys/ý/g; s/yf/ỳ/g; s/y\\/y/g; s/uwj/ự/g; s/uwx/ữ/g; s/uwr/ử/g; s/uws/ứ/g; s/uwf/ừ/g; s/uw\\/ư/g; s/uw/ư/g; s/uj/ụ/g; s/ux/ũ/g; s/ur/ủ/g; s/us/ú/g; s/uf/ù/g; s/u\\/u/g; s/owj/ợ/g; s/owx/ỡ/g; s/owr/ở/g; s/ows/ớ/g; s/owf/ờ/g; s/ow\\/ơ/g; s/ow/ơ/g; s/ooj/ộ/g; s/oox/ỗ/g; s/oor/ổ/g; s/oos/ố/g; s/oof/ồ/g; s/oo\\/ô/g; s/oo/ô/g; s/oj/ọ/g; s/ox/õ/g; s/or/ỏ/g; s/os/ó/g; s/of/ò/g; s/o\\/o/g; s/ij/ị/g; s/ix/ĩ/g; s/ir/ỉ/g; s/is/í/g; s/if/ì/g; s/i\\/i/g; s/eej/ệ/g; s/eex/ễ/g; s/eer/ể/g; s/ees/ế/g; s/eef/ề/g; s/ee\\/ê/g; s/ee/ê/g; s/ej/ẹ/g; s/ex/ẽ/g; s/er/ẻ/g; s/es/é/g; s/ef/è/g; s/e\\/e/g; s/dd/đ/g; s/d\\/d/g; s/aaj/ậ/g; s/aax/ẫ/g; s/aar/ẩ/g; s/aas/ấ/g; s/aaf/ầ/g; s/aa\\/â/g; s/aa/â/g; s/awj/ặ/g; s/awx/ẵ/g; s/awr/ẳ/g; s/aws/ắ/g; s/awf/ằ/g; s/aw\\/ă/g; s/aw/ă/g; s/aj/ạ/g; s/ax/ã/g; s/ar/ả/g; s/as/á/g; s/af/à/g; s/a\\/a/g; s/YJ/Ỵ/g; s/YX/Ỹ/g; s/YR/Ỷ/g; s/YS/Ý/g; s/YF/Ỳ/g; s/Y\\/Y/g; s/UWJ/Ự/g; s/UWX/Ữ/g; s/UWR/Ử/g; s/UWS/Ứ/g; s/UWF/Ừ/g; s/UW\\/Ư/g; s/UW/Ư/g; s/UJ/Ụ/g; s/UX/Ũ/g; s/UR/Ủ/g; s/US/Ú/g; s/UF/Ù/g; s/U\\/U/g; s/OWJ/Ợ/g; s/OWX/Ỡ/g; s/OWR/Ở/g; s/OWS/Ớ/g; s/OWF/Ờ/g; s/OW\\/Ơ/g; s/OW/Ơ/g; s/OOJ/Ộ/g; s/OOX/Ỗ/g; s/OOR/Ổ/g; s/OOS/Ố/g; s/OOF/Ồ/g; s/OO\\/Ô/g; s/OO/Ô/g; s/OJ/Ọ/g; s/OX/Õ/g; s/OR/Ỏ/g; s/OS/Ó/g; s/OF/Ò/g; s/O\\/O/g; s/IJ/Ị/g; s/IX/Ĩ/g; s/IR/Ỉ/g; s/IS/Í/g; s/IF/Ì/g; s/I\\/I/g; s/EEJ/Ệ/g; s/EEX/Ễ/g; s/EER/Ể/g; s/EES/Ế/g; s/EEF/Ề/g; s/EE\\/Ê/g; s/EE/Ê/g; s/EJ/Ẹ/g; s/EX/Ẽ/g; s/ER/Ẻ/g; s/ES/É/g; s/EF/È/g; s/E\\/E/g; s/E/E/g; s/DD/Đ/g; s/D\\/D/g; s/AAJ/Ậ/g; s/AAX/Ẫ/g; s/AAR/Ẩ/g; s/AAS/Ấ/g; s/AAF/Ầ/g; s/AA\\/Â/g; s/AA/Â/g; s/AWJ/Ặ/g; s/AWX/Ẵ/g; s/AWR/Ẳ/g; s/AWS/Ắ/g; s/AWF/Ằ/g; s/AW\\/Ă/g; s/AW/Ă/g; s/AJ/Ạ/g; s/AX/Ã/g; s/AR/Ả/g; s/AS/Á/g; s/AF/À/g; s/A\\/A/g;')

if [ "$should_copy" = "yes" ]; then
  echo "$result" | xsel -bi
else
  echo "$result"
fi
