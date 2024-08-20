#include "getkey.h"

Getkey::Getkey()
{

}

void Getkey::run()
{
    const char *device = "/dev/input/event3";
    int fd = open(device, O_RDONLY);
    if (fd < 0) {
        perror("Unable to open device");
        return ;
    }

    struct input_event ie;
    while (true) {
        ssize_t n = read(fd, &ie, sizeof(struct input_event));
        if (n < 0) {
            perror("Read error");
            close(fd);
            return ;
        }
        if (n == sizeof(struct input_event)) {
            if (ie.type == EV_KEY) {
                std::cout << "Key Code: " << ie.code << " Value: " << ie.value << std::endl;

                if(ie.value==1){
                    if(ie.code==115)
                        emit keyid(1);
                    if(ie.code==114)
                        emit keyid(2);
                    if(ie.code==158)
                        emit keyid(3);
                    if(ie.code==139)
                        emit keyid(4);
                }
                else
                    emit keyid(5);
            }
        }
    }

    close(fd);

}
