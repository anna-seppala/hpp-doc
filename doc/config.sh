export PATH=$DEVEL_DIR/install/sbin:$DEVEL_DIR/install/bin:$PATH
export PKG_CONFIG_PATH=$DEVEL_DIR/install/lib/pkgconfig/:/opt/grx/lib/pkgconfig

export PYTHONPATH=$DEVEL_DIR/install/lib/python2.7/site-packages:$DEVEL_DIR/install/lib/python2.7/dist-packages:/opt/ros/groovy/lib/python2.7/dist-packages:$PYTHONPATH

export LD_LIBRARY_PATH=$DEVEL_DIR/install/lib:/opt/ros/groovy/lib:$LD_LIBRARY_PATH

if [ -f $DEVEL_DIR/install/setup.bash ]; then
    source $DEVEL_DIR/install/setup.bash
endif
