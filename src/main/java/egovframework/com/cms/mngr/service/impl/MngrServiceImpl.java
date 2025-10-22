package egovframework.com.cms.mngr.service.impl;

import egovframework.com.cms.mngr.repository.MngrRepository;
import egovframework.com.cms.mngr.service.MngrService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MngrServiceImpl implements MngrService {

    @Autowired
    private MngrRepository mngrRepository;


}
