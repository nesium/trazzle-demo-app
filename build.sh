mxmlc \
-default-background-color=#efefef \
-default-frame-rate=31 \
-default-size 400 500 \
-include-libraries+=libc/TrazzleLib.swc \
-includes+=Assets \
-incremental=true \
-library-path+=libc/TrazzleCore.swc \
-library-path+=libc/TrazzleLib.swc \
-output=bin/TrazzleDemoApp.swf \
-source-path+=src \
-source-path+=lib/minimalcomps \
-source-path+=assets \
-verbose-stacktraces=true \
-warnings=true \
src/com/nesium/TrazzleDemoApp.as