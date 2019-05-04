package com.lzf.flyingsocks.client;

import com.lzf.flyingsocks.*;
import com.lzf.flyingsocks.client.proxy.socks.SocksProxyComponent;
import com.lzf.flyingsocks.client.view.ViewComponent;

public class StandardClient extends TopLevelComponent implements Client {

    StandardClient() {
        super(DEFAULT_COMPONENT_NAME);
    }

    @Override
    protected void initInternal() {
        addComponent(new SocksProxyComponent(this));
        addComponent(new ViewComponent(this));
        super.initInternal();
    }

    @Override
    protected void startInternal() {
        super.startInternal();
    }

    @Override
    protected void stopInternal() {
        super.stopInternal();
        System.exit(0);
    }

    @Override
    protected void restartInternal() {
        throw new ComponentException("can not restart client");
    }

}
