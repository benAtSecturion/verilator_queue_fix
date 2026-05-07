// DESCRIPTION: Verilator: Verilog Test module
//
// This file ONLY is placed under the Creative Commons Public Domain.
// SPDX-FileCopyrightText: 2025 Wilson Snyder
// SPDX-License-Identifier: CC0-1.0

`define stop $stop
`define checks(gotv,expv) do if ((gotv) != (expv)) begin $write("%%Error: %s:%0d:  got='%h' exp='%h'\n", `__FILE__,`__LINE__, (gotv), (expv)); end while(0);
module t;

  int i_header;
  int i_len;
  int i_data;
  int i_crc;

  int o_header;
  int o_len;
  int o_data;
  int o_crc;
  //this will not compile without -fno-life
  //full compiler command: ~/verilator/bin/verilator_bin_dbg --cc ../t_stream_queue.v -CFLAGS "-g -O0" --main --exe --build --timing --debug -fno-const -fno-life --gdbbt --dump-tree-addrids --decorations node --Mdir trace_objs/ > failed.txt
  initial begin
    byte byte_pkt[$];
    logic [15:0] sdata_pkt[$];
    int int_pkt[$];
    logic [63:0] qdata_pkt[$];
    logic [128:0] vlwide_pkt[$];

    i_header = 12;
    i_len = 5;
    i_data = 11;
    i_crc = 42;
    // #5;
    //-------------------- STREAML ------------------------------------
    //test with IData
    // byte_pkt = {<<8{i_header}};
    // o_header = {<<8{byte_pkt}};
    // `checks(o_header,i_header);

    byte_pkt = {<<8{i_header,i_len}};
    {<<8{o_header,o_len}} = byte_pkt;
    `checks({i_header,i_len},{o_header,o_len});

    // byte_pkt = {<<8{i_header,i_len,i_crc,i_data}};
    // {<<8{o_header,o_len,o_crc,o_data}} = byte_pkt;

    // `checks({>>{byte_pkt}},{<<8{i_header,i_len,i_crc,i_data}});
    // `checks({o_header,o_len,o_crc,o_data} ,{i_header,i_len,i_crc,i_data});

    // //----------- SData QUEUE --------
    // sdata_pkt = {<<8{i_header}};
    // o_header = {<<8{sdata_pkt}};
    // `checks(o_header,i_header);

    // //test with QData
    // sdata_pkt = {<<8{i_header,i_len}};
    // {<<8{o_header,o_len}} = sdata_pkt;
    // `checks({i_header,i_len},{o_header,o_len});

    // sdata_pkt = {<<8{i_header,i_len,i_crc,i_data}};
    // {<<8{o_header,o_len,o_crc,o_data}} = sdata_pkt;

    // `checks({>>{sdata_pkt}},{<<8{i_header,i_len,i_crc,i_data}});
    // `checks({o_header,o_len,o_crc,o_data} ,{i_header,i_len,i_crc,i_data});

    // //----------- IData QUEUE --------
    // int_pkt = {<<8{i_header}};
    // o_header = {<<8{int_pkt}};
    // `checks(o_header,i_header);

    // //test with QData
    // int_pkt = {<<8{i_header,i_len}};
    // {<<8{o_header,o_len}} = int_pkt;
    // `checks({i_header,i_len},{o_header,o_len});

    // int_pkt = {<<8{i_header,i_len,i_crc,i_data}};
    // {<<8{o_header,o_len,o_crc,o_data}} = int_pkt;

    // `checks({>>{int_pkt}},{<<8{i_header,i_len,i_crc,i_data}});
    // `checks({o_header,o_len,o_crc,o_data} ,{i_header,i_len,i_crc,i_data});

    // //----------- QData QUEUE --------
    // qdata_pkt = {<<8{i_header}};
    // o_header = {<<8{qdata_pkt}};
    // `checks(o_header,i_header);

    // //test with QData
    // qdata_pkt = {<<8{i_header,i_len}};
    // {<<8{o_header,o_len}} = qdata_pkt;
    // `checks({i_header,i_len},{o_header,o_len});


    // qdata_pkt = {<<8{i_header,i_len,i_crc,i_data}};
    // {<<8{o_header,o_len,o_crc,o_data}} = qdata_pkt;

    // `checks({>>{qdata_pkt}},{<<8{i_header,i_len,i_crc,i_data}});
    // `checks({o_header,o_len,o_crc,o_data} ,{i_header,i_len,i_crc,i_data});

    //----------- VLWide QUEUE --------
    // vlwide_pkt = {<<8{i_header}};
    // o_header = {<<8{vlwide_pkt}};
    // `checks(o_header,i_header);

    // test with QData
    // vlwide_pkt = {<<8{i_header,i_len}};
    // {<<8{o_header,o_len}} = vlwide_pkt;
    // $display("%h %h",{i_header,i_len},{o_header,o_len});


    // vlwide_pkt = {<<8{i_header,i_len,i_crc,i_data}};
    // {<<8{o_header,o_len,o_crc,o_data}} = vlwide_pkt;

    // `checks({>>{vlwide_pkt}},{<<8{i_header,i_len,i_crc,i_data}});
    // `checks({o_header,o_len,o_crc,o_data} ,{i_header,i_len,i_crc,i_data});
    // $displayh(vlwide_pkt);

    // -------------------- STREAMR ------------------------------------
    // byte_pkt = {>>{i_header,i_len,i_crc,i_data}};
    // foreach(byte_pkt[i])
    //   $display("%h",byte_pkt[i]);
    // $display("%h o_header %h i_header",o_header,i_header);
    // $finish;
  end


endmodule
