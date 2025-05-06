
// -----------------------------------------------------------------------
/*
	uart_test.c

					Sep/20/2020
*/
// -----------------------------------------------------------------------
#include <stdio.h>
#include <stdbool.h>
#include <stdlib.h>
#include <fcntl.h>
#include <termio.h>
#include <unistd.h>
#include <sys/ioctl.h>
#include <string.h>
#include <sys/select.h>
#include <jpeglib.h>
#include <stdint.h>
#define SERIAL_PORT "/dev/ttyS4"
int main(int argc,char *argv[])
{
	int fd;
	int it;
	uint8_t buf[24576];
	struct termios tio;
	uint8_t input[24576];
	uint8_t r_ary[16384],g_ary[16384],b_ary[16384];
	printf( "*** start ***\n");
	fprintf(stderr, "*** Sep/30/2020 ***\n");

	for (it = 0; it < sizeof(buf); it++)
		{
		buf[it] = 0;
		}

	int rv; 
	struct timeval timeout;

	timeout.tv_sec = 0;
	timeout.tv_usec = 0;

	fd_set set;

	if ((fd = open(SERIAL_PORT, O_RDWR)) < 0)
		{
		fprintf(stderr, "open error\n");
		exit(1);
		}

	FD_ZERO(&set);
	FD_SET(fd, &set);

	fprintf(stderr, "*** check *** aaa ***\n");

	bzero(&tio, sizeof(tio));

	/* 115200bps, フロー制御有り, ８ビット，DTR/DSR無効，受信可能 */
	tio.c_cflag= B3000000 | CS8 | CLOCAL | CREAD ;
	tio.c_iflag =IGNPAR|IGNBRK;
	tio.c_cc[VMIN] = 1;	/* 入力データをバッファしない */
	tcsetattr(fd, TCSANOW, &tio); /* アトリビュートのセット */
	int sum=0;
	uint32_t i,j;
  uint8_t w[88];
	w[0]=0xE6;
	w[1]=0x00;
	w[2]=0x00;
	while(1){
		write(fd, w, 2);
		usleep(1000);
	}		
	
  close(fd);
   return 0;

}

