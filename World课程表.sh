#!落泪哥哥
if [ "$(id -u)" != "0" ]; then
echo -e "\033[31m \n\n\n           课程表必须以 ROOT 权限执行\n\n \033[0m" 
   exit 
fi
skip=48
set -e
tab='	'
nl='
'
IFS=" $tab$nl"
umask=`umask`
umask 77
gztmpdir=
trap 'res=$?
  test -n "$gztmpdir" && rm -fr "$gztmpdir"
  (exit $res); exit $res
' 0 1 2 3 5 10 13 15
case $TMPDIR in
  / | /*/) ;;
  /*) TMPDIR=$TMPDIR/;;
  *) TMPDIR=/data/adb/;;
esac
if type mktemp >/dev/null 2>&1; then
  gztmpdir=`mktemp -d "${TMPDIR}gztmpXXXXXXXXX"`
else
  gztmpdir=${TMPDIR}gztmp$$; mkdir $gztmpdir
fi || { (exit 127); exit 127; }
gztmp=$gztmpdir/$0
case $0 in
-* | */*'
') mkdir -p "$gztmp" && rm -r "$gztmp";;
*/*) gztmp=$gztmpdir/`basename "$0"`;;
esac || { (exit 127); exit 127; }
case `printf 'X\n' | tail -n +1 2>/dev/null` in
X) tail_n=-n;;
*) tail_n=;;
esac
if tail $tail_n +$skip <"$0" | gzip -cd > "$gztmp"; then
  umask $umask
  chmod 700 "$gztmp"
  (sleep 5; rm -fr "$gztmpdir") 2>/dev/null &
  "$gztmp" ${1+"$@"}; res=$?
else
  printf >&2 '%s\n' "别看了我都不知道咋解密  其实喊爸爸自动解密 $0"
  (exit 127); res=127
fi; exit $res
�6��cWorld课程表.sh �Yko�f��_qf*J'%&mEQ�2!`А���u�$^}�l��CH�ҵ�@�`�
4�
�qk������ŗ~b?a�v��IC�}(C�c�������}���P�sz:�I�2ϨHB�4^�@H�B��``��=ݶU��d�?����TSc[[H�*�+�4�j��F	CĄ�j$��f��AS|N�']��4�i�bD��Nl���"ן�
?(9��#�g��l,��r�7z���]4���+#�N=E����f6��"<Ņ�	��2�
�P�v:�iq��a���"w�9Yd��Kt8Ճ
aŖ��&��:�B�Y�De��YI�ٰ���Q1~��i�C`/�Ut�
d������l�C	�A�XE�Ԉ�Ijb4̣1� ��\��L����q�Uc��v�Z�
�ġ�JH6*����c/��9��&�b�� @㾝!������/�z�/M1��t�\gc0.E�bXl�T��-T���`�-����[�mU��T�Jm��v�&B�0���l6��P"d�Q�e��ʖb=U��3���A������x5ƫ1���x�k��x�y/��E��]{U0aޱ���jt�_�CNv�K1�k@a�����9��]�(�E�U�c���Ę[^�o,�i�ָ��#��'����^b�9�A���F��}b�?6:4��Zo��~6W�t��@�>�m�C���ҡ�1��D��$���}��h*J4\^qP� ���q� �]i�.����
�x��P�K�γ�t�K5k��w����ۙ�_��6f�~��v�I \�&јKw&r��5�t�v�P ���;7���].��H(��l|	�����Y�YhIpvEF�
c�&wʚ�$�sd�f�F���\�UT��'�H`/݀t���K3�;3 t��y�z�(��fsC��}s`X�2���O��3f�Ǔƃ��8g�� �����_Z6^�Jhz�V�!�����uL�歩�"����V̩Aktʃ��	.�K5̱J���.VH���]���tC�:&#<��S����̤ykc,�Yl��R�@�����N�Ƽ���e���\fи� �E0��ߚ�Vn��Ɂ��}���<i��Z��[C����/d%�
���9��9���r�Gٻ˩���Q��@QSp$r��0�B�9��^��PCOw���j��5Մe��X6c�i�n^�݀����*vq����U,^-�Va���^$<WxI� ����ݧR|���w.Q���:14�y�+y������A��?潬5���k��qa�����/���G�dNE��A��ބ��d�Ç��[�� O�Y?���1�����M���ĠI�>��=�o<����y*�t/��*��6n�cύ�a�ƒ>�䯑�W��䛇�����!$�/��8�m�������q��8��fT<r�i\�l2��oM^XO&1�-��>���5�L8��\��w�q�3)'>=1���O��V�~����k-'�r�����H�E��Mb�eǥ�>4gdz�d���+�Ԩ���*S�T\�qU	R��F��Ԍ���\�.G�7�1�_�'\��2Q���N�tқ�+�D�dK�J7ϗ%���Ikc���}�]v�o�M�|S��x)s�1�����L&���gt�'5�8�v'��?^M�82�Lg�@	���ۈ.���E�_��i��p\�}���w�7�E�D8��   