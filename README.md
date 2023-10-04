# simple_processor

16 bit system processor with 8 rigsters 

Each instruction is encoded using a 16-bit format. 
If Op2 specifies a register, then the instruction encoding is III0XXX000000YYY
III specifies the instruction, XXX gives the rX register, and YYY gives the rY register.
 If Op2 specifies immediate data #D, then the encoding is III1XXXDDDDDDDDD
the field DDDDDDDDD represents a nine-bit signed (2’s complement) value.



___________________________________________

the instructions that can be implemented 
![image](https://github.com/itsramazain/simple_processor/assets/104790048/e79fbeac-f668-41af-b5ea-49109c3d5800)



_____________________________

architecture 
![image](https://github.com/itsramazain/simple_processor/assets/104790048/b7ab130d-d4b0-4f72-b7c3-6c2eed0ae107)

______________________
waveform_output of first test_bench

![image](https://github.com/itsramazain/simple_processor/assets/104790048/182a46e3-74d1-45aa-bb81-8aac583898d2)

second test_bench_waveform
![image](https://github.com/itsramazain/simple_processor/assets/104790048/822e13fc-acd0-4feb-b016-730b224bfcdb)
