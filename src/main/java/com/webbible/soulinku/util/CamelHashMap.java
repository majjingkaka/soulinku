package com.webbible.soulinku.util;

import java.util.HashMap;

import com.google.common.base.CaseFormat;

@SuppressWarnings("rawtypes")
public class CamelHashMap extends HashMap{
    private static final long serialVersionUID = 1l;

    @SuppressWarnings("unchecked")
    public Object put(Object key, Object value){
        return super.put(CaseFormat.UPPER_UNDERSCORE.to(CaseFormat.LOWER_CAMEL, (String) key), value);
    }
}
