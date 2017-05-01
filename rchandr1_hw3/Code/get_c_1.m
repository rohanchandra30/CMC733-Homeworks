function c = get_c_1(dels, K)
c{1} = exp(-(dels{1}/K).^2);
c{2} = exp(-(dels{2}/K).^2);
c{3} = exp(-(dels{3}/K).^2);
c{4} = exp(-(dels{4}/K).^2);
c{5} = (exp(-(dels{5}/K).^2))/sqrt(2);
c{6} = (exp(-(dels{6}/K).^2))/sqrt(2);
c{8} = (exp(-(dels{8}/K).^2))/sqrt(2);
c{7} = (exp(-(dels{7}/K).^2))/sqrt(2);
end