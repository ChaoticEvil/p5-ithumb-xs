#define PERL_NO_GET_CONTEXT
#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"

#include "ithumb/ithumb.c"


MODULE = Ithumb::XS		PACKAGE = Ithumb::XS
PROTOTYPES: ENABLE

int
convert_image(SV *thumb_params)
	CODE:
        SV **svp;
        unsigned long keylen;
        HV *h_thumb_params = (HV*) SvRV(thumb_params);

        if (!hv_exists(h_thumb_params, "width", 5))
            Perl_croak(aTHX_ "'width' parameter is required");

        if (!hv_exists(h_thumb_params, "height", 6))
            Perl_croak(aTHX_ "'height' parameter is required");

        if (!hv_exists(h_thumb_params, "src_image", 9))
            Perl_croak(aTHX_ "'src_image' (source file path) parameter is required");

        if (!hv_exists(h_thumb_params, "dst_image", 9))
            Perl_croak(aTHX_ "'dst_image' (destionation file path) parameter is required");

        long width, height;
        char *src_path, *dst_path;

        svp = hv_fetch(h_thumb_params, "width", 5, 0);
        width = SvIV(*svp);
        svp = hv_fetch(h_thumb_params, "height", 6, 0);
        height = SvIV(*svp);
        svp = hv_fetch(h_thumb_params, "src_image", 9, 0);
        src_path = SvPV(*svp, keylen);
        svp = hv_fetch(h_thumb_params, "dst_image", 9, 0);
        dst_path = SvPV(*svp, keylen);

        Image image = { (int)width, (int)height, src_path, dst_path };

        int convert_result = resize_and_crop(&image);

        if (convert_result) {
            IError error = get_error(convert_result);
            Perl_croak(aTHX_ "%s", error.msg);
        }

        RETVAL = 1;
    OUTPUT:
        RETVAL
