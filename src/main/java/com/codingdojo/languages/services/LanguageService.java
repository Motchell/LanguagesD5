package com.codingdojo.languages.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.codingdojo.languages.models.Language;
import com.codingdojo.languages.repositories.LanguageRepository;

@Service
public class LanguageService {
	
	private final LanguageRepository languageRepository;
    
    public LanguageService(LanguageRepository languageRepository) {
        this.languageRepository = languageRepository;
    }
    
    public List<Language> getAllLanguages() {
        return languageRepository.findAll();
    }

    public Language getLanguageById(Long id) {
        Optional<Language> languageOptional = languageRepository.findById(id);
        if (languageOptional.isPresent()) {
            return languageOptional.get();
        } else {
            return null;
        }
    }

    public Language createLanguage(Language language) {
        return languageRepository.save(language);
    }

    public Language updateLanguage(Long id, Language languageDetails) {
    	Optional<Language> idBook = languageRepository.findById(id);
    	if(idBook.isPresent()) {
	        Language existingLanguage = getLanguageById(id);
	        existingLanguage.setName(languageDetails.getName());
	        existingLanguage.setCreator(languageDetails.getCreator());
	        existingLanguage.setCurrentVersion(languageDetails.getCurrentVersion());
	        return languageRepository.save(existingLanguage);
    	}else {
    		return null;
    	}
    }

    public void deleteLanguage(Long id) {
        languageRepository.deleteById(id);
    }
}
