package com.codingdojo.languages.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.codingdojo.languages.models.Language;
import com.codingdojo.languages.services.LanguageService;

import jakarta.validation.Valid;
@Controller
@RequestMapping("/languages")
public class LanguageController {
    @Autowired
	private LanguageService languageService;
    
    @GetMapping("")
    public String getAllLanguages(Model model) {
        List<Language> languages = languageService.getAllLanguages();

        model.addAttribute("language", new Language());
        model.addAttribute("languages", languages);

        return "/languages/index.jsp";
    }
    
    @PostMapping("")
    public String createLanguage(@Valid @ModelAttribute("language") Language language, BindingResult result, Model model) {
        if (result.hasErrors()) {
        	List<Language> languages = languageService.getAllLanguages();
            model.addAttribute("languages", languages);
            return "languages/index.jsp";
        }else {
            languageService.createLanguage(language);
            return "redirect:/languages";
        }
    }
    
    @GetMapping("/{id}")
    public String getLanguageDetails(@PathVariable Long id, Model model) {
        Language language = languageService.getLanguageById(id);
        model.addAttribute("language", language);
        return "languages/show.jsp";
    }
    
    @GetMapping("/{id}/edit")
    public String editLanguage(@PathVariable Long id, Model model) {
        Language language = languageService.getLanguageById(id);
        model.addAttribute("language", language);
        return "languages/edit.jsp";
    }
    
    
    /*
     * TODO fix return if result has errors 
     * */

    @PutMapping("/edit/{id}")
    public String updateLanguage(@PathVariable Long id, @Valid @ModelAttribute("language") Language language, BindingResult result, Model model) {
        if (result.hasErrors()) {
        	Language lan = languageService.getLanguageById(id);
            model.addAttribute("language", lan);
            return "languages/"+lan.getId()+"/edit.jsp";
        }else {
            languageService.updateLanguage(id, language);
            return "redirect:/languages/{id}";
        }
        
    }
    
    @DeleteMapping("delete/{id}")
    public String deleteLanguage(@PathVariable Long id) {
        languageService.deleteLanguage(id);
        return "redirect:/languages";
    }

}
