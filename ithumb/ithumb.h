/*
 */
enum IthumbErrors {
    ITHUMB_WIDTH_ERROR    = 0b1100101,
    ITHUMB_HEIGHT_ERROR   = 0b1100110,
    ITHUMB_SRC_ERROR      = 0b1100111,
    ITHUMB_DST_ERROR      = 0b1101000,
    ITHUMB_SCALING_ERROR  = 0b1101001,
    ITHUMB_CROPPING_ERROR = 0b1101010
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
