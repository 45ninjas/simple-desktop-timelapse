FOR /F %%A IN ('WMIC OS GET LocalDateTime ^| FINDSTR \.') DO @SET B=%%A
set TIME_STAMP=%B:~0,4%-%B:~4,2%-%B:~6,2%-%B:~8,2%-%B:~10,2%-%B:~12,2%