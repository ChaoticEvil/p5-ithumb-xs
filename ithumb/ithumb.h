/*

 */
enum IthumbErrors {
    ITHUMB_WIDTH_ERROR    = 101,
    ITHUMB_HEIGHT_ERROR   = 102,
    ITHUMB_SRC_ERROR      = 103,
    ITHUMB_DST_ERROR      = 104,
    ITHUMB_SCALING_ERROR  = 105,
    ITHUMB_CROPPING_ERROR = 106
};

/*
 */
typedef struct image_t {
    int w;
    int h;
    char *src;
    char *dst;
} Image;

/*
 */
typedef struct error_t {
    unsigned short int code;
    char *msg;
} IError;

/*
 */
int resize_and_crop(Image *image);

/*
 */
IError get_error(int err_code);
