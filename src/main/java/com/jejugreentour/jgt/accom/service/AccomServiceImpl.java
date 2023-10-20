package com.jejugreentour.jgt.accom.service;

import com.jejugreentour.jgt.accom.vo.MainAccomImgVO;
import com.jejugreentour.jgt.accom.vo.MainAccomVO;
import lombok.RequiredArgsConstructor;
import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@RequiredArgsConstructor
public class AccomServiceImpl implements AccomService {
    private final SqlSessionTemplate sqlSession;


    @Override
    public String selectNextAccomCode() {
        return sqlSession.selectOne("accomMapper.selectNextAccomCode");
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void addAccom(MainAccomVO mainAccomVO) {
        sqlSession.insert("accomMapper.addAccom", mainAccomVO);
        sqlSession.insert("accomMapper.insertImgs", mainAccomVO);
    }
    
    // 업소 상세 정보
    @Override
    public MainAccomVO selectMainAccomDetail(String accomCode) {
        sqlSession.selectList("accomMapper.selectSubImg", accomCode);
        return sqlSession.selectOne("accomMapper.selectMainAccomDetail", accomCode);
    }

    @Override
    public void updateMainAccomName(MainAccomVO mainAccomVO) {
        sqlSession.update("accomMapper.updateMainAccomName", mainAccomVO);
    }

    @Override
    public void updateMainAccomAddr(MainAccomVO mainAccomVO) {
        sqlSession.update("accomMapper.updateMainAccomAddr", mainAccomVO);
    }

    @Override
    public void updateMainAccomSubImg(MainAccomVO mainAccomVO) {
        sqlSession.insert("accomMapper.insertImgs", mainAccomVO);
    }

    @Override
    public void deleteSubImg(String mainImgCode) {
        sqlSession.delete("accomMapper.deleteSubImg", mainImgCode);
    }

    @Override
    public List<MainAccomImgVO> selectSubImg(String accomCode) {
        return  sqlSession.selectList("accomMapper.selectSubImg", accomCode);
    }


}
