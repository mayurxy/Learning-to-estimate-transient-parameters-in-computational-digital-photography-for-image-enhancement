function [Shutterfinal] = quantize_shutter(NewShutter)

ShutterStdValue=[0.0002 0.0003 0.0004 0.0005 0.0006 0.0008 0.0010 0.0012 0.0015 0.0020 0.0025 0.0031 0.0040 0.0050 0.0062 0.0080 0.0100 0.0125 0.0166 0.0200 0.0250 0.0333 0.0400 0.0500 0.0666 0.0769 0.1000 0.1250 0.1666];

for i=1:length(ShutterStdValue)
    if (NewShutter >= ShutterStdValue(i)) && (NewShutter <= ShutterStdValue(i+1))
        NewShutter = ShutterStdValue(i);
        break;
    
    end
end
Shutterfinal = NewShutter;

