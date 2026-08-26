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


result=$(echo "$text" | sed 's/A/A\\/g ;s/À/AF/g ;s/Á/AS/g ;s/Ả/AR/g ;s/Ã/AX/g ;s/Ạ/AJ/g ;s/Ă/AW/g ;s/Ă/AW\\/g ;s/Ằ/AWF/g ;s/Ắ/AWS/g ;s/Ẳ/AWR/g ;s/Ẵ/AWX/g ;s/Ặ/AWJ/g ;s/Â/AA/g ;s/Â/AA\\/g ;s/Ầ/AAF/g ;s/Ấ/AAS/g ;s/Ẩ/AAR/g ;s/Ẫ/AAX/g ;s/Ậ/AAJ/g ;s/D/D\\/g ;s/Đ/DD/g ;s/E/E/g ;s/E/E\\/g ;s/È/EF/g ;s/É/ES/g ;s/Ẻ/ER/g ;s/Ẽ/EX/g ;s/Ẹ/EJ/g ;s/Ê/EE/g ;s/Ê/EE\\/g ;s/Ề/EEF/g ;s/Ế/EES/g ;s/Ể/EER/g ;s/Ễ/EEX/g ;s/Ệ/EEJ/g ;s/I/I\\/g ;s/Ì/IF/g ;s/Í/IS/g ;s/Ỉ/IR/g ;s/Ĩ/IX/g ;s/Ị/IJ/g ;s/O/O\\/g ;s/Ò/OF/g ;s/Ó/OS/g ;s/Ỏ/OR/g ;s/Õ/OX/g ;s/Ọ/OJ/g ;s/Ô/OO/g ;s/Ô/OO\\/g ;s/Ồ/OOF/g ;s/Ố/OOS/g ;s/Ổ/OOR/g ;s/Ỗ/OOX/g ;s/Ộ/OOJ/g ;s/Ơ/OW/g ;s/Ơ/OW\\/g ;s/Ờ/OWF/g ;s/Ớ/OWS/g ;s/Ở/OWR/g ;s/Ỡ/OWX/g ;s/Ợ/OWJ/g ;s/U/U\\/g ;s/Ù/UF/g ;s/Ú/US/g ;s/Ủ/UR/g ;s/Ũ/UX/g ;s/Ụ/UJ/g ;s/Ư/UW/g ;s/Ư/UW\\/g ;s/Ừ/UWF/g ;s/Ứ/UWS/g ;s/Ử/UWR/g ;s/Ữ/UWX/g ;s/Ự/UWJ/g ;s/Y/Y\\/g ;s/Ỳ/YF/g ;s/Ý/YS/g ;s/Ỷ/YR/g ;s/Ỹ/YX/g ;s/Ỵ/YJ/g ;s/a/a\\/g ;s/à/af/g ;s/á/as/g ;s/ả/ar/g ;s/ã/ax/g ;s/ạ/aj/g ;s/ă/aw/g ;s/ă/aw\\/g ;s/ằ/awf/g ;s/ắ/aws/g ;s/ẳ/awr/g ;s/ẵ/awx/g ;s/ặ/awj/g ;s/â/aa/g ;s/â/aa\\/g ;s/ầ/aaf/g ;s/ấ/aas/g ;s/ẩ/aar/g ;s/ẫ/aax/g ;s/ậ/aaj/g ;s/d/d\\/g ;s/đ/dd/g ;s/e/e\\/g ;s/è/ef/g ;s/é/es/g ;s/ẻ/er/g ;s/ẽ/ex/g ;s/ẹ/ej/g ;s/ê/ee/g ;s/ê/ee\\/g ;s/ề/eef/g ;s/ế/ees/g ;s/ể/eer/g ;s/ễ/eex/g ;s/ệ/eej/g ;s/i/i\\/g ;s/ì/if/g ;s/í/is/g ;s/ỉ/ir/g ;s/ĩ/ix/g ;s/ị/ij/g ;s/o/o\\/g ;s/ò/of/g ;s/ó/os/g ;s/ỏ/or/g ;s/õ/ox/g ;s/ọ/oj/g ;s/ô/oo/g ;s/ô/oo\\/g ;s/ồ/oof/g ;s/ố/oos/g ;s/ổ/oor/g ;s/ỗ/oox/g ;s/ộ/ooj/g ;s/ơ/ow/g ;s/ơ/ow\\/g ;s/ờ/owf/g ;s/ớ/ows/g ;s/ở/owr/g ;s/ỡ/owx/g ;s/ợ/owj/g ;s/u/u\\/g ;s/ù/uf/g ;s/ú/us/g ;s/ủ/ur/g ;s/ũ/ux/g ;s/ụ/uj/g ;s/ư/uw/g ;s/ư/uw\\/g ;s/ừ/uwf/g ;s/ứ/uws/g ;s/ử/uwr/g ;s/ữ/uwx/g ;s/ự/uwj/g ;s/y/y\\/g ;s/ỳ/yf/g ;s/ý/ys/g ;s/ỷ/yr/g ;s/ỹ/yx/g ;s/ỵ/yj/g')

if [ "$should_copy" = "yes" ]; then
  echo "$result" | xsel -bi
else
  echo "$result"
fi