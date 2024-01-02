export const useFinished = () => useState('finished', () => false);
export const usePoints = () => useState('points', () => [0, 0, 0]);